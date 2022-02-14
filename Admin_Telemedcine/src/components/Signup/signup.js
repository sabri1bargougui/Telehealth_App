import React, { Component } from 'react';
import { MDBRow, MDBCol, MDBBtn, MDBIcon } from 'mdbreact';
import './signup.css';
import * as authservice from '../../Services/AuthService';
import { ToastContainer, toast } from 'react-toastify';

class Signup extends Component {
    notify = () => toast.error('Email Already Exist !');
    state = {
        data: { name: "", lastname: "", email: "", password: "" },

    }

    // submit function to register admin in the server
    dosubmit = async () => {
        try {
            const response = await authservice.register(this.state.data);
            localStorage.setItem("token", response.headers["x-access-token"]);
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

    //handle change
    handelchange = ({ currentTarget: input }) => {
        const data = { ...this.state.data };
        data[input.name] = input.value;
        this.setState({ data });
    }

    render() {
        return (
            <MDBRow className="register" >
                <MDBCol md="6">
                    <form onSubmit={this.handelsubmit} className="needs-validation" noValidate>
                        <p className="h4 text-center mb-4">Sign up</p>
                        <label htmlFor="name" className="grey-text">
                            Your name
                             </label>
                        <input value={this.state.data.username} type="text" id="name" name="name" className="form-control" onChange={this.handelchange} required />

                        <div className="invalid-feedback">
                            Please enter your name !.
                         </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>
                        <div className="invalid-feedback">
                            {this.state.errors}
                        </div>

                        <br />

                        <label htmlFor="lastname" className="grey-text">
                            Your LastName
                             </label>
                        <input value={this.state.data.lastname} type="text" id="lastname" name="lastname" className="form-control" onChange={this.handelchange} required />
                        <div className="invalid-feedback">
                            Please enter your lastname !
                            </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>
                        <br />


                        <label htmlFor="email" className="grey-text">
                            Your email
                             </label>
                        <input value={this.state.data.email} type="email" id="email" name="email" className="form-control" onChange={this.handelchange} required />
                        <div className="invalid-feedback">
                            Please enter your email !.
                            </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>
                        <br />

                        <label htmlFor="password" className="grey-text">
                            Your password
                             </label>
                        <input value={this.state.data.password} type="password" id="password" name="password" className="form-control" onChange={this.handelchange} required />
                        <div className="invalid-feedback">
                            Please enter your password !
                            </div>
                        <div className="valid-feedback">
                            <MDBIcon icon="check" />
                        </div>


                        <div className="text-center mt-4">
                            <MDBBtn color="unique" type="submit" onClick={this.handleSubmit}>
                                Register
                              </MDBBtn>
                        </div>
                    </form>
                </MDBCol>
                <ToastContainer />
            </MDBRow>


        );
    }
}

export default Signup;