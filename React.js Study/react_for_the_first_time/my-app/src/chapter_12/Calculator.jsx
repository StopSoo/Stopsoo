import React, { useState } from 'react';
import TemperatureInput from './TemperatureInput';

function BoilingVerdict(props) {
  if (props.celsius >= 100) {
    return <p>물이 끓습니다.</p>;
  }
  return <p>물이 끓지 않습니다.</p>;
}

function toCelsius(fahrenheit) {  // 온도를 섭씨로 변환
  return ((fahrenheit - 32) * 5) / 9;
}

function toFahrenheit(celsius) {  // 온도를 화씨로 변환
  return (celsius * 9) / 5 + 32;
}

function tryConvert(temperature, convert) { // 위 두 함수를 인자로 받아 변환을 수행
  const input = parseFloat(temperature);
  if (Number.isNaN(input)) {
    // input이 NaN일 경우 
    return '';
  }
  const output = convert(input);
  const rounded = Math.round(output * 1000) / 1000;
  return rounded.toString();
}

function Calculator(props) {
  const [temperature, setTemperature] = useState('');
  const [scale, setScale] = useState('c');

  const handleCelsiusChange = (temperature) => {
    setTemperature(temperature);
    setScale('c');
  };

  const handleFahrenheitChange = (temperature) => {
    setTemperature(temperature);
    setScale('f');
  };

  const celsius = (scale == 'f') ? tryConvert(temperature, toCelsius) : temperature;
  const fahrenheit = (scale === 'c') ? tryConvert(temperature, toFahrenheit) : temperature;

  return (
    <div>
      <TemperatureInput 
        scale='c'
        temperature={celsius}
        onTemperatureChange={handleCelsiusChange}
      />
      <TemperatureInput 
        scale='f'
        temperature={fahrenheit}
        onTemperatureChange={handleFahrenheitChange}
      />
      <BoilingVerdict celsius={parseFloat(celsius)} />
    </div>
  );
}

export default Calculator;