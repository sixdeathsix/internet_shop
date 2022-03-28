import {makeAutoObservable} from 'mobx'


export default class DeviceObserve {
  constructor() {
    this._types = [];
    this._brands = [];
    this._devices = [];
    this._searchDevices = [];
    this._page = 1;
    this._totalCount = 0;
    this._limit = 8;
    this._isloading = true;

    this._basketDevices = [];
    this._basket = [];

    this._historyDevices = [];
    this._history = [];

    this._selectedType = {};
    this._selectedBrand = {};
    
    makeAutoObservable(this);
  }

  setTypes(types) {
    this._types = types;
  }
  
  setBrands(brands) {
    this._brands = brands;
  }

  setDevices(devices) {
    this._devices = devices;
  }

  setSearchDevices(searchDevices) {
    this._searchDevices = searchDevices;
  }
  
  setSelectedType(type) {
    this.setPage(1)
    this._selectedType = type
  }

  setSelectedBrand(brand) {
    this.setPage(1)
    this._selectedBrand = brand
  }
  
  setPage(page) {
    this._page = page
  }
  
  setTotalCount(count) {
    this._totalCount = count
  }

  setIsloading(isloading) {
    this._isloading = isloading
  }

  setBasketDevices(basketDevices) {
    this._basketDevices = basketDevices;
  }

  setBasket(basket) {
    this._basket = basket;
  }

  setHistoryDevices(historyDevices) {
    this._historyDevices = historyDevices;
  }

  setHistory(history) {
    this._history = history;
  }

  get types() {
    return this._types;
  }

  get brands() {
    return this._brands;
  }

  get devices() {
    return this._devices;
  }

  get searchDevices() {
    return this._searchDevices;
  }

  get selectedType() {
    return this._selectedType
  }

  get selectedBrand() {
    return this._selectedBrand
  }

  get page() {
    return this._page
  }

  get totalCount() {
    return this._totalCount
  }

  get limit() {
    return this._limit
  }

  get isloading() {
    return this._isloading
  }

  get basketDevices() {
    return this._basketDevices
  }

  get basket() {
    return this._basket
  }

  get historyDevices() {
    return this._historyDevices
  }

  get history() {
    return this._history
  }
}
