import React, { Component } from 'react'


class PlayButton extends Component {
  state = {
    isPlaying: false
  }

  onClick = () => {
    const isPlaying = !this.state.isPlaying
    this.setState({isPlaying})
    if (isPlaying) {
      this.props.loop.start()
    } else {
      this.props.loop.stop()
    }
  }

  render () {
    return (
      <button
          type="button"
          onClick={this.onClick}
      >{this.state.isPlaying ? 'Stop' : 'Play'}</button>
    )
  }
}

export default PlayButton


