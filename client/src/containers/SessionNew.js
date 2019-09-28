import React from "react";
import DuoSynthNew from "../components/instruments/DuoSynthNew";
import MonoSynthNew from "../components/instruments/MonoSynthNew";
import FMSynthNew from "../components/instruments/FMSynthNew";
import AMSynthNew from "../components/instruments/AMSynthNew";
import NewInstrumentForm from "../components/AddInstrumentForm";
import EditSessionForm from "../components/EditSessionForm";

// const API = "";

class SessionNew extends React.Component {
  state = {
    sessionName: "New Session",
    sessionInstruments: [],
    addNew: false,
    editSessionName: false
  };

  componentDidMount() {

  }

  newInstrumentForm = () => {
    this.setState({
      addNew: !this.state.addNew
    });
  };

  addNewInstrument = instrument => {
    this.setState({
      sessionInstruments: [instrument, ...this.state.sessionInstruments]
    });
  };

  editSessionName = e => {
    this.setState({ editSessionName: !this.state.editSessionName });
  };

  updateSessionName = name => {
    console.log('name: ', name);
    this.setState({
            sessionName: name,
            editSessionName: !this.state.editSessionName
          });
    // const SESSION_URL = this.props.match.url;

    // fetch(SESSION_URL, {
    //   method: "PATCH",
    //   headers: {
    //     "Content-Type": "application/json",
    //     Accept: "application/json"
    //   },
    //   body: JSON.stringify({ name: name })
    // })
    //   .then(res => res.json())
    //   .then(synthObject => {
    //     this.setState({
    //       sessionName: synthObject.name,
    //       editSessionName: !this.state.editSessionName
    //     });
    //   });
  };

  removeSynth = synthId => {
    const newInstrumentsArray = this.state.sessionInstruments.filter(
      instrument => instrument.id !== synthId
    );
    this.setState({
      sessionInstruments: newInstrumentsArray
    });
  };

  render() {
    let sessionInstruments = this.state.sessionInstruments.map(instrument => {
      switch (instrument.instrument_type) {
        case "MonoSynth":
          return (
            <MonoSynthNew
              key={instrument.id}
              synthApi={instrument}
              removeSynth={this.removeSynth}
            />
          );
        case "DuoSynth":
          return (
            <DuoSynthNew
              key={instrument.id}
              synthApi={instrument}
              removeSynth={this.removeSynth}
            />
          );
        case "FMSynth":
          return (
            <FMSynthNew
              key={instrument.id}
              synthApi={instrument}
              removeSynth={this.removeSynth}
            />
          );
          case "AMSynth":
          return (
            <AMSynthNew
              key={instrument.id}
              synthApi={instrument}
              removeSynth={this.removeSynth}
            />
          );
        default:
          return null;
      }
    });

    return (
      <div className="session-container">
        {this.state.editSessionName ? (
          <EditSessionForm
            editSessionName={this.editSessionName}
            updateSessionName={this.updateSessionName}
            addNewInstrument={this.addNewInstrument}
            sessionName={this.state.sessionName}
          />
        ) : (
          <div className="session-head">
            <h1 onClick={this.editSessionName}>{this.state.sessionName}</h1>
            <h1 onClick={this.newInstrumentForm}>| + Add Synth</h1>
          </div>
        )}

        {this.state.addNew ? (
          <NewInstrumentForm
            newInstrumentForm={this.newInstrumentForm}
            addNewInstrument={this.addNewInstrument}
            sessionName={this.state.sessionName}
          />
        ) : null}

        {sessionInstruments}
      </div>
    );
  }
}

export default SessionNew;
