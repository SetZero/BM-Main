#pragma once

namespace BMCPP {
	namespace AVR {
		template<typename T>
		concept bool isUC() {
			return requires(T t) {
				typename T::Port;
				typename T::SPI;
				typename T::Timer8Bit;
				typename T::ADConverter;
			};
		}
	}
}