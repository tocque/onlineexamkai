import Cookies from '../npm/js.cookie.js'

const TokenKey = 'Admin-Token'

export function getToken() {
  return 'mocking'
  // return Cookies.get(TokenKey)
}

export function setToken(token) {
  return 'mocking'
  // return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
