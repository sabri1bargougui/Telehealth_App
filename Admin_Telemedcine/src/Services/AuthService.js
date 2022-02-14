import axios from 'axios';


export function login(email, password) {
    return axios.post("http://localhost:3000/admin/login", { email, password });

}

export function register(user) {
    return axios.post("http://localhost:3000/admin/register", {
        name: user.name,
        lastname: user.lastname,
        email: user.email,
        password: user.password,

    });
}

export default {
    login,
    register
};
