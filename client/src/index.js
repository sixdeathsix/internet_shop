import React, { createContext } from 'react';
import ReactDOM from 'react-dom';
import {App} from './App';
import UserObserve from './observer/UserObserve'
import DeviceObserve from './observer/DeviceObserve';

export const Context = createContext(null);

ReactDOM.render(
  <Context.Provider 
    value={{
      user: new UserObserve(),
      device: new DeviceObserve()
    }}
  >
    <App />
  </Context.Provider>,
  document.getElementById('root')
);