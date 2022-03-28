import { observer } from 'mobx-react-lite';
import React, { useContext } from 'react'
import { Routes, Route } from 'react-router-dom'
import { Context } from '../index';
import { adminRoutes, privateRoutes, publicRoutes  } from './Routes.js';

export const AppRouter = observer(() => {

  const {user} = useContext(Context);

  return (
    <Routes>
      {user.role == 'ADMIN' && adminRoutes.map(r => 
        <Route 
          key={r.path}
          exact={r.exact} 
          path={r.path} 
          element={r.element}  
        />
      )}
      {user.isAuth && privateRoutes.map(r => 
        <Route 
          key={r.path}
          exact={r.exact} 
          path={r.path} 
          element={r.element}  
        />
      )}
      {publicRoutes.map(r => 
        <Route 
          key={r.path}
          exact={r.exact} 
          path={r.path} 
          element={r.element}  
        />
      )}
    </Routes>
  )
})
