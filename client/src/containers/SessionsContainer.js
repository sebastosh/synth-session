import { Link } from "react-router-dom";
import React, { Component } from "react";
import SessionNew from "./SessionNew"


export class SessionsContainer extends Component {
  state = {
    sessions: []
  }

  render() {

    const userSessions = this.props.currentUserSessions;

    
    let renderSessions = userSessions.map(usersession => {
      return (
        <div className="card" key={usersession.id}>
          <Link to={`/sessions/${usersession.id}`}>{usersession.name}</Link> 
      </div>
      );
    });
  
    return (
      <div>
        {renderSessions}
        {!localStorage.token ? <SessionNew /> : null}
      </div>
    );
  }
}

export default SessionsContainer;
