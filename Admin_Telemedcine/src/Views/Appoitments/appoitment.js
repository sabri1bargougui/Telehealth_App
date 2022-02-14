import React, { Component } from 'react';
import { MDBDataTableV5, MDBIcon } from 'mdbreact';
import axios from 'axios';

class Appoitment extends Component {
    state = {
        appoitments: [],
        tableRows: [],
    }
    notify = () => toast.warn("Analys deleted Successfully !");
    // update component state
    async componentDidMount() {
        await axios.get('http://localhost:3000/admin/appoitments', {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })

            .then(response => response.data)

            .then(data => {

                this.setState({ appoitments: data })

            })

            .then(async () => {

                this.setState({ tableRows: this.getappoitments() })

            });

    };

    // get all appoitment on the server 
    getappoitments = () => {
        let appoitments = this.state.appoitments.map((appoitment) => {
            return (
                {
                    phonenumber: appoitment.phonenumber,
                    name: appoitment.name + ' ' + appoitment.lastname,
                    date: appoitment.date,
                    doctor: appoitment.doctor,
                    status: appoitment.isaccepted,
                    accept: <MDBIcon
                        icon='calendar-check'
                        className='green-text'
                        size='2x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.handelstatus(appoitment._id)}
                    />,
                    reject: <MDBIcon
                        icon='calendar-times'
                        className='red-text'
                        size='2x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.deniedappointment(appoitment._id)}
                    />,



                }
            )
        });

        return appoitments;

    };
    handelstatus = async apId => {
        var token = localStorage.getItem("token");

        await axios.patch("http://localhost:3000/admin/appoitments/" + apId, {
            headers: {
                'x-access-token': token
            },
            body: {
                isaccepted: 'not yet'
            }
        }).catch(e => console.log(e));

        window.location.reload();

        // this.notify();
    };
    deniedappointment = async apId => {
        var token = localStorage.getItem("token");

        await axios.patch("http://localhost:3000/admin/appoitments/denied/" + apId, {
            headers: {
                'x-access-token': token
            },
            body: {
                isaccepted: 'not yet'
            }
        }).catch(e => console.log(e));

        window.location.reload();

        // this.notify();
    };
    completeappointment = async apId => {
        var token = localStorage.getItem("token");

        await axios.patch("http://localhost:3000/admin/appoitments/complete/" + apId, {
            headers: {
                'x-access-token': token
            },
            body: {
                isaccepted: 'not yet'
            }
        }).catch(e => console.log(e));

        window.location.reload();

        // this.notify();
    };

    render() {
        const data = {
            columns: [
                {
                    label: 'Numéro de téléphone',
                    field: 'phonenumber',
                    sort: 'asc',
                    width: 150
                },
                {
                    label: 'Nom',
                    field: 'name',
                    sort: 'asc',
                    width: 270
                },
                {
                    label: 'Date',
                    field: 'date',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Docteur',
                    field: 'doctor',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Status',
                    field: 'status',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Accepter',
                    field: 'accept',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Rejeter',
                    field: 'reject',
                    sort: 'asc',
                    width: 200
                },

            ],
            rows: this.state.tableRows,
        };
        return (
            <MDBDataTableV5 hover data={data} filter='name' proSelect searchTop searchBottom={false} />
        );
    }
}

export default Appoitment;