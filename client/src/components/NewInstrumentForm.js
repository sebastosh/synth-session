import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import Select from "react-select";

export class NewInstrumentForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user_id: "",
      currentUser: {},
      instruments: [],
      sessionInstruments: []
    };

    this.options = [
      { value: "MonoSynth", label: "Mono Synth" },
      { value: "DuoSynth", label: "Duo Synth" },
      { value: "FMSynth", label: "FM Synth" }
    ];
  }

  componentDidMount() {
    fetch('/instruments')
      .then(response => response.json())
      .then(instrumentData => {
        this.setState({ instruments: instrumentData.data });
      });
  }

  handleSubmit = e => {
    e.preventDefault();

    this.state.selectedOption.map(instrument => {
      let newInstrument = {
        name: `${this.props.sessionName}-${instrument.label}`,
        instrument_type: instrument.value
      };
      
      fetch('/instruments', {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json"
        },
        body: JSON.stringify(newInstrument)
      })
        .then(res => res.json())
        .then(newInstrumentReturn => {
          
          let newSessionInstrument = {
            name: `${this.props.sessionName}-${instrument.label}`,
            session_id: this.props.match.params.sessionsId,
            instrument_id: newInstrumentReturn.id
          };

          fetch('/session_instruments', {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json"
            },
            body: JSON.stringify(newSessionInstrument)
          })
            .then(res => res.json())
            .then(newSessionInstrumentReturn => {

              this.props.addNewInstrument(newInstrumentReturn);
              this.props.newInstrumentForm()
            });
        });
        return "cool"
    });
  };

  handleChange = selectedOption => {
    this.setState({ selectedOption });
  };

  render() {
    return (
      <form className="new-instruments-form" onSubmit={this.handleSubmit}>
        <Select
          isMulti
          name="synths"
          options={this.options}
          className="basic-multi-select"
          onChange={this.handleChange}
          placeholder="Select One or More Synths"
        />
      </form>
    );
  }
}

export default withRouter(NewInstrumentForm);
