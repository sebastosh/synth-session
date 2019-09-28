import React, { Component } from "react";
import ReactDOM from "react-dom";

export class EditSessionForm extends Component {
  state = {
    name: ""
  };

  componentDidMount() {
    
    ReactDOM.findDOMNode(this.refs.divFocus).focus();
    this.setState({name:this.props.name})
  }

  handleSubmit = e => {
    e.preventDefault();
    this.props.updateInstrumentName(this.state.name);
  };

  handleChange = e => {
    this.setState({ [e.target.name]: e.target.value });
  };

  render() {
    return (
      <div className="synth-title-edit">

       <form className="edit-instrument-form" onSubmit={this.handleSubmit}>
       <input
            ref="divFocus"
            tabIndex={1}
            type="text"
            value={this.state.name}
            placeholder={this.props.name}
            onBlur={this.props.instrumentNameToggle}
            onChange={this.handleChange}
            name="name"
          />

       </form>
      </div>
    );
  }
}

export default EditSessionForm;
