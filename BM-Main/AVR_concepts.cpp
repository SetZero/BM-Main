
namespace AVR {
	template<typename T>
	concept bool isPin() {
		return requires(T t) {
			typename T::port_type;
			T::on();
			T::off();
			T::number;
			T::template dir<Output>();
		};
	}
}