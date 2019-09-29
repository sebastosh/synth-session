import React, { Component } from "react";
import {
  BrowserRouter as Router,
  NavLink,
  withRouter
} from "react-router-dom";
import NewSessionForm from "./NewSessionForm";


export class NavBar extends Component {
  state = {
    newClick: false,
    help: false
  };

  resetState = () => {
    this.setState({ newClick: false });
  };
  newSessionClick = () => {
    this.setState({ newClick: !this.state.newClick });
  };

  showHelp = e => {
    this.setState({ help: !this.state.help });
  };

  render() {
    return (
      <div className="navbar">
       
        <NavLink to="/">
          <span role="img" aria-label="sessions" alt="session">
          Synth Sessions 🎛
          </span>
        </NavLink>
        {localStorage.token && !this.state.newClick ? (
          <span className="newButton" onClick={this.newSessionClick} role="img" aria-label="new session" alt="new session">
            🎹
          </span>
        ) : null}

        {this.state.newClick ? (
          <NewSessionForm
            {...this.props}
            sessionUser={this.props.sessionUser}
            addSession={this.props.addSession}
            newClick={this.newSessionClick}
          />
        ) : null}

        {localStorage.token ? (
          <div className="navuser">
                       {this.state.help ? (
              <div className="key-ui">
                <img onClick={this.showHelp} src="/Piano.png" alt="piano keyboard mapping" />
              </div>
            ) : null}
            <span
              onClick={this.showHelp}
              className="help-button"
              role="img"
              aria-label="help"
              alt="Help"
            >
              <img src="/question-circle.svg" alt="piano keyboard mapping" />
            </span>
            <div className="nav">
           
              <NavLink onClick={this.resetState} to="/profile">
                <span role="img" aria-label="profile" alt="Profile">
                <img src="/home.svg" alt="piano keyboard mapping" />
                </span>
              </NavLink>
            </div>
            <div className="nav">
              <NavLink onClick={this.resetState} to="/signout">
                Log Out
              </NavLink>
            </div>
          </div>
        ) : (
          <div className="navuser">
             {this.state.help ? (
              <div className="key-ui">
                <img onClick={this.showHelp} src="/Piano.png" alt="piano keyboard mapping" />
              </div>
            ) : null}
              <span
              onClick={this.showHelp}
              className="help-button"
              role="img"
              aria-label="help"
              alt="Help"
            >
              <img src="/question-circle.svg" alt="piano keyboard mapping" />
            </span>
            <NavLink className="nav" onClick={this.resetState} to="/login">
              <span role="img" aria-label="Login" alt="Log in">
                Log in
              </span>
            </NavLink>
   
            <NavLink className="nav" onClick={this.resetState} to="/signup">
              <span role="img" aria-label="Sign Up" alt="Sign Up">
              Sign Up
              </span>
            </NavLink>
 
          </div>
        )}
      </div>
    );
  }
}

export default withRouter(NavBar);
