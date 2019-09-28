import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import EditInstrumentForm from '../EditInstrumentForm';
import AMSynth from './AMSynth'

function TitleAndChildren({ children, title }) {
  return (
    <div style={{ margin: 0 }}>
           {children}
<h4 className={"subtitle"}>{title}</h4>

    </div>
  );
}

export class Synth extends Component {
  constructor(props) {
    super(props);
    this.state = {
      instrumentNameToggle: false,
      synthName: "",
      synthType: "",
    };
  }

  componentDidMount() {
    ReactDOM.findDOMNode(this.refs.divFocus).focus();
  }

  componentWillReceiveProps(props) {
    console.log("props: ", props);
    this.setState({
      synthType: props.synthApi.instrument_type,
      synthName: props.synthApi.name
    });

    if (props.synthApi.settings !== null) {
      this.setState({
        settings: props.synthApi.settings
      });
    }
  }

  instrumentNameToggle = e => {
    this.setState(
      { instrumentNameToggle: !this.state.instrumentNameToggle },
      () => {
        if (!this.state.instrumentNameToggle) {
          this.saveSynth();
        }
      }
    );
  };

  updateInstrumentName = name => {
    console.log("name: ", name);
    this.setState({ synthName: name });
    this.instrumentNameToggle();
  };

  saveSynth = () => {
    let synthFromState = {
      name: this.state.synthName,
      settings: this.state.settings
    };

    fetch(`/instruments/${this.props.synthApi.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify(synthFromState)
      // body: {"settings": this.state.settings}
    }).then(res => res.json());
  };

  removeSynth = () => {
    this.props.removeSynth(this.props.synthApi.id);

    fetch("/session_instruments/")
      .then(response => response.json())
      .then(sessionInstrumentData => {
        let thisSI = sessionInstrumentData.data.filter(
          si => si.attributes.instrument_id === this.props.synthApi.id
        );
        thisSI.map(instrument => {
          fetch(`/session_instruments/${instrument.id}`, {
            method: "delete"
          }).then(res => {
            fetch(`/instruments/${this.props.synthApi.id}`, {
              method: "delete"
            });
          });
          return "cool";
        });
      });
  };

  render() {
    return (
      <div>
        {this.state.instrumentNameToggle ? (
          <div className="synth-title">
            <EditInstrumentForm
              updateInstrumentName={this.updateInstrumentName}
              instrumentNameToggle={this.instrumentNameToggle}
              name={this.props.synthApi.name}
            />
          </div>
        ) : (
          <div onClick={this.instrumentNameToggle} className="synth-title">
            {this.props.synthApi.name}
          </div>
        )}

        <span
          role="img"
          aria-label="Save Synth"
          className="save-synth"
          onClick={this.saveSynth}
        >
          💾
        </span>
        <span
          role="img"
          aria-label="Save Synth"
          className="remove-synth"
          onClick={this.removeSynth}
        >
          Delete
        </span>
          <AMSynth />
        <div
          className="fm-synth"
          tabIndex={1}
          ref="divFocus"
          onKeyPress={this.onKeyPressed}
          onKeyUp={this.onKeyLifted}
        >
          <TitleAndChildren title="Gain">
            <Dial value="0.4" onChange={this.handleGain} />
          </TitleAndChildren>

          <TitleAndChildren title="Harmonicity">
            <Dial value="2" max="4" onChange={this.handleHarmonicity} />
          </TitleAndChildren>

          <TitleAndChildren title="Mod Index">
            <Dial
              value="10"
              min="0"
              max="40"
              onChange={this.handleModulationIndex}
            />
          </TitleAndChildren>

          <TitleAndChildren title="Osc">
            <Select
              options={["sine", "square", "sawtooth", "triangle"]}
              value={"sine"}
              onChange={this.handleOsc1}
            />
          </TitleAndChildren>

          <TitleAndChildren title="Mod">
            <Select
              options={["sine", "square", "sawtooth", "triangle"]}
              value={"sine"}
              onChange={this.handleOsc2}
            />
          </TitleAndChildren>

          <TitleAndChildren title="Filter Env">
            <Multislider
              size={[100, 100]}
              numberOfSliders="3"
              min="0"
              max="10"
              candycane="3"
              values={[
                this.state.settings.modulationEnvelopeAttack,
                this.state.settings.modulationEnvelopeDecay,
                this.state.settings.modulationEnvelopeSustain,
                this.state.settings.modulationEnvelopeRelease
              ]}
              onChange={this.handleFilter}
            />
          </TitleAndChildren>

          <TitleAndChildren title="Env ADSR">
            <Multislider
              size={[100, 100]}
              numberOfSliders="4"
              min="0"
              max="10"
              candycane="4"
              values={[
                this.state.settings.envelopeAttack,
                this.state.settings.envelopeDecay,
                this.state.settings.envelopeSustain,
                this.state.settings.envelopeRelease
              ]}
              onChange={this.handleEnvelope}
            />
          </TitleAndChildren>
          <KeyBoard
            handleClickOctave={this.handleClickOctave}
            octave={this.state.octave}
            onDownKey={this.onDownKey}
            onUpKey={this.onUpKey}
          />
        </div>
      </div>
    );
  }
}

export default Synth;
