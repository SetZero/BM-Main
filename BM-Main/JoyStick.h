#pragma once


/*
* Description: ChannelNumberX/Y are the pins which are used to get x/y from the controller
*/
template<typename adc, unsigned char ChannelNumberX, unsigned char ChannelNumberY>
class JoyStick {

	JoyStick() = delete;

public:
	static inline bool isLeft() {
		return adc::template getValue<ChannelNumberX>() < 400;
	}

	static inline bool isRight() {
		return adc::template getValue<ChannelNumberX>() > 600;
	}

	static inline bool isUp() {
		return adc::template getValue<ChannelNumberY>() > 600;
	}

	static inline bool isDown() {
		return adc::template getValue<ChannelNumberY>() < 400;
	}
};
