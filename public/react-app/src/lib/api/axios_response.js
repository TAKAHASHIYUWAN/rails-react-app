// client.js
// axios-case-converterは、snake_case / camelCaseを変換
//import applyCaseMiddleware from 'axios-case-converter';
import axios from 'axios';


const client = axios.create({
    baseURL: 'http://localhost:3000/api/v1',
    headers: {
        'Content-Type': 'application/json',
                'Accept': 'application/json'
    }
});

// 新規作成
export const signup_response = async (params) => {
    const response = await client.post('/signup', params);
    return response
  };

// 更新
export const update_response = async (id,params) => {
    const response = await client.patch(`/update/users/${id}`, params);
    return response
  };

// 削除
export const delete_response = async (id) => {
    const response = await client.delete(`/delete/users/${id}`);
    return response
  };
  

// 一覧
export const index_response = async () => {
  const response = await client.get('/index');
  return response
};

// 詳細
export const show_response = async (id) => {
  const response = await client.get(`/show/${id}`);
  return response
};

//ログイン
export const login_response = async (params) => {
    const response = await client.post('/login',params);
    return response
}

//ログアウト
export const logout_response = async () => {
    const response = await client.post('/logout')
    return response
}