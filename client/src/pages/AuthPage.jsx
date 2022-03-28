import React, { useContext, useState } from 'react'
import { Link, useLocation,useNavigate } from 'react-router-dom'
import { Card, Container, Form, FormControl, Button } from 'react-bootstrap'
import { Context } from '../index'
import { observer } from "mobx-react-lite"
import { registration, login } from '../services/ApiProvider'

export const AuthPage = observer(() => {

  const {user} = useContext(Context);

  const navigate = useNavigate();
  
  const isLogin = useLocation().pathname === '/login';


  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  async function auth() {
    try {
      let data;

      if(isLogin) {
        data = await login(email, password)
      } else {
        data = await registration(name, email, password)
      }

      user.setId(data.id)
      user.setRole(data.role)
      user.setUser(user);
      user.setIsAuth(true);
      navigate('/')
    } catch (e) {
      alert(e.response.data.message)
    }
  }

  return (
    <Container className="d-flex justify-content-center align-items-center" style={{height: window.innerHeight - 56}}>
      <Card className="p-3">
        <h2 className='m-auto'>{isLogin ? 'Авторизация' : 'Регистрация'}</h2>
        <Form className="d-flex flex-column">
          {
            isLogin 
            ?
            null
            :
            <FormControl 
              className="mt-3"
              placeholder="Введите ваше имя"
              value={name}
              onChange={e => setName(e.target.value)}
            />
          }
          <FormControl 
            className="mt-3"
            placeholder="Введите ваш Email"
            value={email}
            onChange={e => setEmail(e.target.value)}
          />
          <FormControl 
            className="mt-3"
            placeholder="Введите ваш пароль"
            type="password"
            value={password}
            onChange={p => setPassword(p.target.value)}
          />
          {
            isLogin 
            ?
            <div className='d-flex justify-content-between align-items-center mt-3'>
              <div className='d-flex align-self-center flex-wrap'>
                <div>Нет аккаунта?</div>
                <Link to="/registration" className='mx-lg-2' style={{color: 'blue'}}>Зарегистрируйся!</Link>
              </div>
              <Button variant="outline-dark" onClick={auth}>
                Войти
              </Button>
            </div>
            :
            <div className='d-flex justify-content-between align-items-center mt-3'>
              <div className='d-flex align-self-center flex-wrap'>
                <div>Есть аккаунт?</div>
                <Link to="/login" className='mx-lg-2' style={{color: 'blue'}}>Авторизуйся!</Link>
              </div>
              <Button variant="outline-dark" onClick={auth}>
                Зарегистрироваться
              </Button>
            </div>
          }
        </Form>
      </Card>
    </Container>
  )
})
