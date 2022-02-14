import React, { Component } from 'react';
import { MDBContainer, MDBBtn, MDBModal, MDBModalBody, MDBModalHeader, MDBModalFooter, MDBIcon, MDBRow, MDBCol } from 'mdbreact';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';

class Analys extends Component {
    notify = () => toast.success(" Analys added Successfully !");
    state = {
        modal: false,
        data: {
            name: "", lastname: "", numorder: "", dateprelv: "", datenais: "",
            valone: "", valtwo: "", analysnameone: "", analysnametwo: "", valuselone: "",
            valuseltwo: "",
            indexnum: "",
            analysname: "",
            numdemande: ""
        },
    }


    // function to add analys to the user
    dosubmit = async userId => {
        const { data } = this.state;
        return axios.post("http://localhost:3000/admin/analys" + '/' + userId, {
            name: data.name,
            lastname: data.lastname,
            numdOrder: data.numorder,
            dateprelv: data.dateprelv,
            datenais: data.datenais,
            valone: data.valone,
            valtwo: data.valtwo,
            analysnameone: data.analysnameone,
            analysnametwo: data.analysnametwo,
            valuselone: data.valuselone,
            valuseltwo: data.valuseltwo,
            indexnum: data.indexnum,
            analysname: data.analysname,
            numdemande: data.numdemande,
        },
            {
                headers: {
                    'x-access-token': localStorage.getItem("token")
                }
            }
        )

    }

    // handel submit

    handelsubmit = e => {
        e.preventDefault();
        e.target.className += " was-validated";
        this.dosubmit(this.props.userId);
        this.toggle();
        this.notify();

    }

    // handle change
    handelchange = ({ currentTarget: input }) => {
        const data = { ...this.state.data };
        data[input.name] = input.value;
        this.setState({ data });
    }


    toggle = () => {
        this.setState({
            modal: !this.state.modal
        });
    }


    render() {
        return (
            <MDBContainer>
                <MDBIcon
                    icon='plus'
                    className='green-text'
                    size='2x'
                    style={{ cursor: 'pointer' }}
                    onClick={this.toggle}
                />
                <MDBModal isOpen={this.state.modal} toggle={this.toggle}>
                    <MDBModalHeader toggle={this.toggle}>Add Analys</MDBModalHeader>
                    <MDBModalBody>
                        <form onSubmit={this.handelsubmit}>
                            <MDBRow>
                                {/* *******NAME*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="name"
                                        className="grey-text" >
                                        Prénom
                                        </label>
                                    <input

                                        name="name"
                                        type="text"
                                        id="name"
                                        className="form-control"
                                        placeholder="First name"
                                        required
                                        value={this.state.data.name}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>
                                {/* ******* Last NAME*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="lastname"
                                        className="grey-text" >
                                        Nom
                                        </label>
                                    <input
                                        name="lastname"
                                        type="text"
                                        id="lastname"
                                        className="form-control"
                                        placeholder="LastName"
                                        required
                                        value={this.state.data.lastname}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>
                                {/* *******Num Order*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="numorder"
                                        className="grey-text">
                                        Num Order
                                       </label>
                                    <input
                                        name="numorder"
                                        type="text"
                                        id="numorder"
                                        className="form-control"
                                        placeholder="Num Order"
                                        required
                                        value={this.state.data.numorder}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>

                            </MDBRow>
                            <MDBRow>
                                {/* *******Date Naiss*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="datenais"
                                        className="grey-text" >
                                        Date de Naiss
                                      </label>
                                    <input
                                        name="datenais"
                                        type="text"
                                        id="datenais"
                                        className="form-control"
                                        name="datenais"
                                        placeholder="Date de Nais"
                                        required
                                        value={this.state.data.datenais}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                                {/* *******Value1*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="valone"
                                        className="grey-text" >
                                        Value 1
                                        </label>
                                    <input

                                        type="text"
                                        id="valone"
                                        className="form-control"
                                        name="valone"
                                        placeholder=" Value 1"
                                        required
                                        value={this.state.data.valone}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                                {/* *******Value 2*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="valtwo"
                                        className="grey-text" >
                                        Value 2
                                      </label>
                                    <input

                                        type="text"
                                        id="valtwo"
                                        className="form-control"
                                        name="valtwo"
                                        placeholder="Value 2"
                                        required
                                        value={this.state.data.valtwo}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                            </MDBRow>

                            <MDBRow>
                                {/* *******Analys Name 1*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="analysnameone"
                                        className="grey-text" >
                                        Nom Analyse 1
                                      </label>
                                    <input
                                        type="text"
                                        id="analysnameone"
                                        className="form-control"
                                        name="analysnameone"
                                        placeholder="Analys Name One"
                                        required
                                        value={this.state.data.analysnameone}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>
                                {/* *******Analys name 2*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="analysnametwo"
                                        className="grey-text" >
                                        Nom Analyse 2
                                        </label>
                                    <input

                                        type="text"
                                        id="analysnametwo"
                                        className="form-control"
                                        name="analysnametwo"
                                        placeholder="Analys Name Two"
                                        required
                                        value={this.state.data.analysnametwo}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                                {/* *******Val usual 1*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="valuselone"
                                        className="grey-text" >
                                        Valeur habituel 1
                                      </label>
                                    <input
                                        type="text"
                                        id="valuselone"
                                        className="form-control"
                                        name="valuselone"
                                        placeholder=" Val Usual 1"
                                        required
                                        value={this.state.data.valuselone}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>
                            </MDBRow>
                            <MDBRow>
                                {/* *******Val usual 2 *****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="valuseltwo"
                                        className="grey-text" >
                                        Valeur habituel 2
                                      </label>
                                    <input

                                        type="text"
                                        id="valuseltwo"
                                        className="form-control"
                                        name="valuseltwo"
                                        placeholder="Val Usual 2"
                                        required
                                        value={this.state.data.valuseltwo}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                                {/* *******Index*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="indexnum"
                                        className="grey-text" >
                                        Index
                                        </label>
                                    <input

                                        type="text"
                                        id="indexnum"
                                        className="form-control"
                                        name="indexnum"
                                        placeholder="Index"
                                        required
                                        value={this.state.data.indexnum}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>
                                {/* *******Analys Name *****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="analysname"
                                        className="grey-text" >
                                        Nom d'Analys
                                      </label>
                                    <input

                                        type="text"
                                        id="analysname"
                                        className="form-control"
                                        name="analysname"
                                        placeholder="Name Analys"
                                        required
                                        value={this.state.data.analysname}
                                        onChange={this.handelchange}
                                    />
                                </MDBCol>

                                {/* *******Date prelv*****  */}
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="dateprelv"
                                        className="grey-text"  >
                                        Date de Prelv
                                           </label>
                                    <input
                                        type="Text"
                                        id="dateprelv"
                                        className="form-control"
                                        name="dateprelv"
                                        placeholder=" Date de Prelv"
                                        value={this.state.data.dateprelv}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                                <MDBCol md="4" className="mb-3">
                                    <label
                                        htmlFor="numdemande"
                                        className="grey-text"  >
                                        Num Demande
                                           </label>
                                    <input
                                        type="Text"
                                        id="numdemande"
                                        className="form-control"
                                        name="numdemande"
                                        placeholder=" num demande"
                                        value={this.state.data.numdemande}
                                        onChange={this.handelchange}
                                    />

                                </MDBCol>
                            </MDBRow>

                        </form>
                    </MDBModalBody>
                    <MDBModalFooter>
                        <MDBBtn color="secondary" onClick={this.toggle}>Fermer</MDBBtn>
                        <MDBBtn color="primary" onClick={this.handelsubmit}>Submit</MDBBtn>
                    </MDBModalFooter>
                </MDBModal>
                <ToastContainer />

            </MDBContainer>
        );
    }
}

export default Analys;
