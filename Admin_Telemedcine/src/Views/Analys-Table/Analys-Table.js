import React, { Component } from 'react';
import { MDBIcon, MDBDataTableV5 } from 'mdbreact';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';

class Analyses extends Component {
    notify = () => toast.warn("Analys deleted Successfully !");

    state = {
        analyses: [],
        tableRows: [],
    }

    // update componenet state 
    async componentDidMount() {
        await axios.get('http://localhost:3000/admin/analys', {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })

            .then(response => response.data)

            .then(data => {

                this.setState({ analyses: data })

            })

            .then(async () => {

                this.setState({ tableRows: this.getanalys() });

            });

    }

    //  get all analyses in the data base
    getanalys = () => {
        let analyses = this.state.analyses.map((analys) => {
            return (
                {
                    id: analys._id,
                    name: analys.name + ' ' + analys.lastname,
                    ordernum: analys.numdOrder,
                    delete: <MDBIcon
                        icon='trash'
                        className='red-text'
                        size='1x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.handeldelete(analys._id)}
                    />,


                }
            )
        });

        return analyses;

    }

    // delete Analys
    handeldelete = async analysId => {
        await axios.delete("http://localhost:3000/admin/analys/" + analysId, {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })
        this.setState((prev) => ({
            tableRows: prev.tableRows.filter(
                (row) => row.id !== analysId
            )
        }));
        this.notify();
    };

    render() {
        const data = {
            columns: [
                {
                    label: 'ID',
                    field: 'id',
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
                    label: "Numéro d'Order",
                    field: 'ordernum',
                    sort: 'asc',
                    width: 270
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

export default Analyses;