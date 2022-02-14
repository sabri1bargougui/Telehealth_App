import React, { Component } from 'react';
import { MDBIcon, MDBRow, MDBCol, MDBBtn } from 'mdbreact';
import './Login.css'
import * as authservice from '../../Services/AuthService';
import { ToastContainer, toast } from 'react-toastify';

class Login extends Component {
    notify = () => toast.error('please check your Email Or Password !');
    state = {
        data: { email: "", password: "" },

    }


    // submit function to the server 
    dosubmit = async () => {
        const { data } = this.state;
        try {
            const { data: jwt } = await authservice.login(data.email, data.password);
            localStorage.setItem("token", jwt);
            window.location = "/";
        } catch {
            this.notify();
        }


    }

    // handle submit
    handelsubmit = e => {
        e.preventDefault();
        e.target.className += " was-validated";
        this.dosubmit();

    }

    // handle change
    handelchange = ({ currentTarget: input }) => {
        const data = { ...this.state.data };
        data[input.name] = input.value;
        this.setState({ data });
    }

    render() {
        return (
            <MDBRow className="login" >
                <MDBCol md="6">
                    <form onSubmit={this.handelsubmit} className="needs-validation" noValidate>
                        <p className="h4 text-center mb-4">Connexion</p>
                        <label htmlFor="email" className="grey-text">
                            email
                            </label>
                        <input name="email" type="email" id="email" className="form-control" onChange={this.handelchange} required value={this.state.data.email} />
                        <div className="invalid-feedback">
                            Please enter your email !.
                            </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>
                        <br />

                        <label htmlFor="password" className="grey-text">
                            password
                         </label>
                        <input type="password" id="password" className="form-control" onChange={this.handelchange} required value={this.state.data.password} name="password" />
                        <div className="invalid-feedback">
                            Please enter your password !
                            </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>

                        <div className="text-center mt-4">
                            <MDBBtn color="indigo" type="submit" onClick={this.handelsubmit}>Login</MDBBtn>
                        </div>
                    </form>
                </MDBCol>
                <ToastContainer />
            </MDBRow>



        );
    }

}

export default Login;

