#pragma once

namespace BMCPP {
	namespace RFID {
		template<typename T>
		concept bool isCardType() {
			return requires(T t) {
				typename T::CommandWord;
			};
		}
	}
}