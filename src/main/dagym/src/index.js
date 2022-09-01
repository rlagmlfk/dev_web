import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import BootStrapApp from './BootStrapApp';
import WorkoutApp from './WorkoutApp';
import App from "./app";
import "@fortawesome/fontawesome-free/js/all.js";
import { BrowserRouter } from 'react-router-dom';

const root = ReactDOM.createRoot(document.getElementById('root5'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <BootStrapApp />
    </BrowserRouter>
  {/* <WorkoutApp /> */}
  {/* <App /> */}
  </React.StrictMode>
);

