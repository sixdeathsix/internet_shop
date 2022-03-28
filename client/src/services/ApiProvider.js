import axios from "axios";
import decode from 'jwt-decode'

export const URL = 'http://localhost:5000/';

const $url = axios.create({
  baseURL: URL
})

$url.interceptors.request.use((c) => {
  c.headers.authorization = `Bearer ${localStorage.getItem('jwtoken')}`
  return c
})

export async function registration(name, email, password) {
  const {data} = await $url.post('api/user/registration', {name, email, password, role: 'USER'})
  localStorage.setItem('jwtoken', data.jwtoken)
  return decode(data.jwtoken)
}

export async function login(email, password) {
  const {data} = await $url.post('api/user/login', {email, password})
  localStorage.setItem('jwtoken', data.jwtoken)
  return decode(data.jwtoken)
}

export async function checkAuth(email, password) {
  const {data} = await $url.get('api/user/auth' )
  localStorage.setItem('jwtoken', data.jwtoken)
  return decode(data.jwtoken)
}

export async function fetchUser(id) {
  const {data} = await $url.get('api/user/user/' + id)
  return data
}


export async function createType(type) {
  const {data} = await $url.post('api/type', type)
  return data
}

export async function fetchTypes() {
  const {data} = await $url.get('api/type')
  return data
}

export async function createBrand(brand) {
  const {data} = await $url.post('api/brand', brand)
  return data
}

export async function fetchBrands() {
  const {data} = await $url.get('api/brand')
  return data
}

export async function createDevice(device) {
  const {data} = await $url.post('api/device', device)
  return data
}

export async function fetchDevice(id) {
  const {data} = await $url.get('api/device/' + id)
  return data
}

export async function fetchSearchDevices() {
  const {data} = await $url.get('api/device/all')
  return data
}

export async function fetchDevices(typeId, brandId, page, limit) {
  const {data} = await $url.get('api/device', {
    params: {
      typeId, brandId, page, limit
    }
  })
  return data
}

export async function fetchBasketDevices(basketId) {
  const {data} = await $url.get('api/basketDevice/' + basketId)
  return data
}

export async function addBasketDevice(basketId, deviceId) {
  const {data} = await $url.post('api/basketDevice', {basketId, deviceId})
  return data
}

export async function deleteBasketDevice(basketId, deviceId) {
  const {data} = await $url.delete('api/basketDevice', {data: {basketId: basketId, deviceId: deviceId}})
  return data
}

export async function deleteDevice(id) {
  const {data} = await $url.delete('api/device', {data: {id: id}})
  return data
}

export async function deleteType(id) {
  const {data} = await $url.delete('api/type', {data: {id: id}})
  return data
}

export async function deleteBrand(id) {
  const {data} = await $url.delete('api/brand', {data: {id: id}})
  return data
}

export async function fetchHistoryDevices(historyId) {
  const {data} = await $url.get('api/historyDevice/' + historyId)
  return data
}

export async function addHistoryDevice(historyId, deviceId) {
  const {data} = await $url.post('api/historyDevice', {historyId, deviceId})
  return data
}

export async function addHistoryDeviceArray(historyId, array) {
  const {data} = await $url.post('api/historyDevice/array', {historyId, array})
  return data
}