import { BrowserRouter } from "react-router-dom";
import {AppRouter} from "./routes/AppRouter";
import './App.css';
import { Context } from './index'

import React, { useState, useContext, useEffect } from 'react'
import Header from "./components/Header";
import { observer } from "mobx-react-lite";
import { checkAuth } from "./services/ApiProvider";
import { Spinner } from "react-bootstrap";

export const App = observer(() => {

  const {user} = useContext(Context)

  const [loading, setLoading] = useState(true)

  useEffect(() => {
    setTimeout(() => {
      checkAuth().then((data) => {
        user.setUser(true);
        user.setRole(data.role);
        user.setId(data.id);
        user.setIsAuth(true);
      }).finally(() => setLoading(false))
    }, 1000);

  }, [])

  if(loading) {
    return <Spinner />
  }

  return (
    <BrowserRouter >
      <Header />
      <AppRouter />
    </BrowserRouter>
  )
}) 