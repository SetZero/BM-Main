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
				typename T::Mem_Width;
				T::ClkRate;
			};
		}

		template<typename T>
		concept bool isPort() {
			return requires(T t) {
				T::ddr();
				T::get();
				T::read();
			};
		}
	}
}