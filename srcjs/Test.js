import React, { useState } from 'react'
import AudioReactRecorder, { RecordState } from 'audio-react-recorder'

function Test(){

    const [recordState, setRecordState] = useState(RecordState.NONE);
    const [audioUrl, setAudioUrl] = useState(null);

    const start = (audioData) => {
        setRecordState(RecordState.START)
        console.log('start');
        console.log(audioData.url);
      }

    const stop = () => {
        setRecordState(RecordState.STOP)
        console.log('stop');
      }

      //audioData contains blob and blobUrl
    const  onStop = (audioData) => {
        console.log('audioData', audioData)
        console.log('Url', audioData.url)
        setAudioUrl(audioData.url)
    }

    return(
      <div>

        <AudioReactRecorder state={recordState} onStop={onStop} />

        <button onClick={start}>Start</button>
        <button onClick={stop}>Stop</button>

        <audio src={audioUrl} controls="controls" />
      </div>
    );
}


export default Test;
