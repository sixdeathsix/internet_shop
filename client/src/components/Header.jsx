import React, { useContext } from 'react'
import { Context } from '../index'
import { Link } from 'react-router-dom'
import { Navbar, Container, Nav, NavLink, Button, Row } from 'react-bootstrap'
import { observer } from "mobx-react-lite"
import { useNavigate  } from 'react-router-dom'

const Header = observer(() => {

    const {user} = useContext(Context);
    const navigate = useNavigate();

    function logOut() {
      localStorage.removeItem('jwtoken');
      user.setUser({});
      user.setIsAuth(false);
      navigate('/');
    }
  
    return (
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
        <Container>
          <Navbar.Brand style={{cursor: 'pointer'}} onClick={() => navigate('/')}>Магазинчик</Navbar.Brand>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          {
            user.isAuth
            ?
            <Navbar.Collapse id="responsive-navbar-nav">
              <Nav className="me-auto"></Nav>
              <Nav className='gap-2'>
                <Row className='d-flex align-items-center'><Link to="/">Главная</Link></Row>
                <Row className='d-flex align-items-center'><Link to="/user">Профиль</Link></Row>
                <Row className='d-flex align-items-center'><Link to="/basket">Корзина</Link></Row>
                {
                  user.role == 'ADMIN'
                  ?
                  <Button variant="outline-light" onClick={() => navigate('/admin')}>
                    Админ панель
                  </Button>
                  :
                  null
                }
                <Button className='mx-lg-2' variant="outline-light" onClick={() => logOut()}>
                  Выйти
                </Button>
              </Nav>
            </Navbar.Collapse>
            :
            <Navbar.Collapse id="responsive-navbar-nav">
              <Nav className="me-auto"></Nav>
              <Nav className='gap-2'>
                <Row className='d-flex align-items-center'><Link to="/">Главная</Link></Row>
                <Link to="/login">
                  <Button className='d-flex w-100 justify-content-center' variant="outline-light">
                    Войти
                  </Button>
                </Link>
              </Nav>
            </Navbar.Collapse>
          }
        </Container>
      </Navbar>
    )
  }
)

export default Header