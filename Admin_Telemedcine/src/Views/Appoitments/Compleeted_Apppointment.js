import React, { Component } from 'react';
import { MDBDataTableV5, MDBIcon } from 'mdbreact';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';

class Appoitment extends Component {
    state = {
        appoitments: [],
        tableRows: [],
    }
    notify = () => toast.warn("Analys deleted Successfully !");
    // update component state
    async componentDidMount() {
        await axios.get('http://localhost:3000/admin/appoitments/completed', {
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
                    delete: <MDBIcon
                        icon='trash'
                        className='red-text'
                        size='1x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.handeldelete(appoitment._id)}
                    />,




                }
            )
        });

        return appoitments;

    };
    handeldelete = async apId => {
        await axios.delete("http://localhost:3000/admin/appoitments/" + apId, {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })
        this.setState((prev) => ({
            tableRows: prev.tableRows.filter(
                (row) => row.id !== apId
            )
        }));
        this.notify();
        window.location.reload();
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
                    label: 'Supprimer',
                    field: 'delete',
                    sort: 'asc',
                    width: 200
                },

            ],
            rows: this.state.tableRows,
        };
        return (
            <div>
                <MDBDataTableV5 hover data={data} filter='name' proSelect searchTop searchBottom={false} />
                <ToastContainer />
            </div>


        );
    }
}

export default Appoitment;