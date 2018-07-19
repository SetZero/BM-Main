namespace BMCPP {
	namespace literals {
		constexpr const char* __ATTR_PROGMEM__ operator "" _pgm(const char* input, size_t size) {
			return (const char* __ATTR_PROGMEM__) input;
		}
	}
}