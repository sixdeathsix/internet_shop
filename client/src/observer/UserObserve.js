import {makeAutoObservable} from 'mobx'


export default class UserObserve {
  constructor() {
    this._isAuth = false;
    this._user = {};
    this._role = '';
    this._id = -1;
    this._name = '';
    this._email = '';
    makeAutoObservable(this)
  }

  setIsAuth(bool) {
    this._isAuth = bool;
  }
  
  setUser(user) {
    this._user = user;
  }

  setRole(role) {
    this._role = role;
  }

  setId(id) {
    this._id = id;
  }
  
  setName(name) {
    this._name = name;
  }

  setEmail(email) {
    this._email = email;
  }

  get isAuth() {
    return this._isAuth;
  }

  get user() {
    return this._user;
  }

  get role() {
    return this._role;
  }

  get id() {
    return this._id;
  }

  get name() {
    return this._name;
  }

  get email() {
    return this._email;
  }
}
