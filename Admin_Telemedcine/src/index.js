import React from "react";
import ReactDOM from "react-dom";
import "@fortawesome/fontawesome-free/css/all.min.css";
import "bootstrap-css-only/css/bootstrap.min.css";
import "mdbreact/dist/css/mdb.css";
import 'react-toastify/dist/ReactToastify.css';
import "./index.css";
import App from "./App";



import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<div className="w-auto p-3"><App /></div>,
    document.getElementById('root'));

registerServiceWorker();