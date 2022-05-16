import React, { useState } from 'react';
import AudioReactRecorder, { RecordState } from './AudioRecordCanvas';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';


function Spectogram(props){

  const { audioUrl, setAudioUrl, recordState, onStop, serverAudioHost, setServerAudioHost } = useBetween(useShareableState);

  // console.log(props)
  setServerAudioHost(props.host)

  return (
    <AudioReactRecorder state={recordState} onStop={onStop} />
  );

}





export default Spectogram;
