#pragma once
#include <limits.h>

namespace utils {


	//////////////////////////////////////////////////
	//// aha meta is cool hmmmm

	template<bool condition, typename T1, typename T2>
	struct conditional;

	template<typename T, T X>
	struct integralConstant;

	template<typename T, typename O>
	struct isEqual;

	template<auto x>
	struct	minRequired;

	template<auto x>
	struct minRequiredUnsigned;
	

	template<typename T>
	struct isUnsigned;

	namespace details {
		template<bool condition, typename T1, typename T2>
		struct conditional
		{
			using type = T2;
		};

		template<typename T1, typename T2>
		struct conditional<true, T1, T2>
		{
			using type = T1;
		};


		template<typename T, typename O>
		struct isEqual
		{
			static constexpr bool value = false;
		};

		template<typename T>
		struct isEqual<T, T>
		{
			static constexpr bool value = true;
		};


		template<long long x>
		struct	minRequired {
			using min = 							
				typename conditional<x <= SCHAR_MAX && x >= SCHAR_MIN , char,
					typename conditional<x <= SHRT_MAX && x >= SHRT_MIN, short,
						typename conditional<x <= INT_MAX && x >= INT_MIN, int,
							typename conditional<x <= LONG_MAX && x >= LONG_MIN, long, long long
							>::type
						>::type
					>::type
				>::type;
		};

		template<unsigned long long x>
		struct	minRequiredUnsigned {
			using min = 
				typename conditional<x <= UCHAR_MAX, unsigned char,
					typename conditional<x <= USHRT_MAX, unsigned short,
						typename conditional<x <= UINT_MAX, unsigned int,
							typename conditional<x <= ULONG_MAX, unsigned long, unsigned long long
							>::type
						>::type
					>::type
				>::type;
		};

		template<typename T>
		struct isUnsigned {
			static constexpr bool value = false;
		};

		template<>
		struct isUnsigned<unsigned char>
		{
			static constexpr bool value = true;
		};

		template<>
		struct isUnsigned<unsigned short>
		{
			static constexpr bool value = true;
		};

		template<>
		struct isUnsigned<unsigned int>
		{
			static constexpr bool value = true;
		};

		template<>
		struct isUnsigned<unsigned long>
		{
			static constexpr bool value = true;
		};

		template<>
		struct isUnsigned<unsigned long long>
		{
			static constexpr bool value = true;
		};

		template<typename integral, integral val>
		struct isPositive {
			static constexpr bool value = val > 0 ? true : false;
		};
	}

	template<bool condition, typename T1, typename T2>
	struct conditional {
		using type = typename details::conditional<condition, T1, T2>::type;
	};

	template<typename T, T X>
	struct integralConstant {
		static constexpr T value = X;
		using value_type = T;
		using type = integralConstant;
	};

	template<typename T, typename O>
	struct isEqual {
		static constexpr bool value = details::isEqual<T, O>::value;
	};

	//#define minReqS(value) typename utils::minRequired<decltype(value),value>::type
	template<auto x>
	struct minRequired {
		using type = typename conditional<x <= INT_MAX,typename details::minRequired<x>::min,void>::type;
		static_assert(!isEqual<type, void>::value, "signed value is too big to fit to an unsigned type");
	};

	//#define minReqU(value) typename utils::minRequiredUnsigned<decltype(value),value>::type
	template<auto x>
	struct minRequiredUnsigned {
		static_assert(x >= 0, " tried to use unsigned type for negative value");
		using type = typename details::minRequiredUnsigned<x>::min;
	};

	template<typename T>
	struct isUnsigned {
		static constexpr bool value = details::isUnsigned<T>::value;
	};

	template<typename first,typename ...T>
	struct list {
		static constexpr auto size = sizeof...(T)+1;
	};


	template<typename T>
	struct front { using type = T; };

	template<template<typename,typename...> typename list, typename F, typename ...T>
	struct front<list<F,T...>> {
		using type = F;
	};

	template<typename Push, typename L>
	struct push_front {};

	template<typename Push,template<typename...> typename List, typename... T>
	struct push_front<Push,List<T...>>
	{
		using type = List<Push,T...>;
	};

	template<typename T>
	struct pop_front { using type = list<T>; };

	template<typename F, typename ...T>
	struct pop_front<list<F,T...>> {
		using type = list<F,T...>;
	};

	template<unsigned long long F, typename T, typename... P>
	struct getType;

	template<typename T, typename... Ts>
	struct getType<0, T, Ts...>;

	template<unsigned long long F, template<typename, typename...> typename List, typename T, typename... P>
	struct getType<F, List<T, P...>>;


	template<unsigned long long F, typename T, typename... P>
	struct getType
	{
		static_assert(F >= 0, "no negative values allowed");
		static_assert(F < (sizeof...(P)+1), "index out of bounds");
		using type = typename getType<F - 1, P...>::type;
	};

	template<unsigned long long F, template<typename,typename...> typename List,typename T, typename... P>
	struct getType<F,List<T,P...>>
	{

		static_assert(F >= 0, "no negative values allowed");
		//static_assert(F < list<T,P...>::size, "index out of bounds");
		using type = 
			typename getType<F, T, P...>::type;
	};

	//necessary for tl variant (ambiguous instantiation)
	template<template<typename, typename...> typename List, typename T, typename... P>
	struct getType<0, List<T, P...>>
	{
		using type = T;
	};

	template<typename T, typename... Ts>
	struct getType<0,T,Ts...>
	{
		using type = T;
	};

	template<typename first,typename ...T>
	constexpr bool sameTypes() {
		if constexpr(sizeof...(T) == 0) 
			return true;
		else {
			if constexpr (!isEqual<first, typename front<list<T...>>::type>::value)
				return false;
			else
				return sameTypes<T...>();
		}
	
	};
}