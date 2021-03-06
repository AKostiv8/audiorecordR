import React, { useState, useEffect } from 'react'
import { RecordState } from './AudioRecordCanvas';
import {Howl, Howler} from 'howler';
import toWav from "audiobuffer-to-wav";
import axios from "axios";



const useShareableState = () => {
    const [recordState, setRecordState] = useState(RecordState.NONE);
    const [audioUrl, setAudioUrl] = useState(null);
    const [isActive, setIsActive] = useState(false);
    const [clockedSec, setClockedSec] = useState(0);
    const [serverAudioHost, setServerAudioHost] = useState(null)
    // Download button
    const [disableDownload, setDisableDownload] = useState(true);
    // Play button
    const [disablePlay, setDisablePlay] = useState(true);
    const [playRecord, setPlayRecord] = useState(false);
    // Stop button
    const [disableStop, setDisableStop] = useState(true);
    // Set Sound
    const [sound, setSound] = useState(null);

    const start = () => {
      setRecordState(RecordState.START);
      setIsActive(true);
      // Download button
      setDisableDownload(true);
      // console.log('start');
      // Play button
      setDisablePlay(true);
      // Stop button
      setDisableStop(false);
    }

    const stop = () => {
      setRecordState(RecordState.STOP)
      setIsActive(false);
      setClockedSec(0);
      // Download button
      setDisableDownload(false);
      // console.log('stop');
      // Play button
      setDisablePlay(false);
    }


    // audioData contains blob and blobUrl
    const onStop = (audioData) => {

      console.log(audioData.blob)
      // console.log('Url', audioData.url)
      setAudioUrl(audioData.url)
      // Download button
      setDisableDownload(false);
      // Play button
      setDisablePlay(false);
      // Set sound
      setSound(new Howl({src: [audioData.url],format: ['wav']}));

      //var wavfromblob = new File([audioData], "incomingaudioclip.wav");
      //console.log('Test');
      //console.log(wavfromblob);

      if(serverAudioHost !== null) {
        console.log("uploading...");

        let data = new FormData();

        data.append('text', "this is the transcription of the audio file");
        data.append('wavfile', audioData.blob, "recording.wav");

        const config = {
            headers: {'content-type': 'multipart/form-data'}
        }
        axios.post(serverAudioHost, data, config);

        localStorage.clear();
        localStorage.setItem('shinyStore-ex2\\dynamic_url', JSON.stringify(audioData.url));
      }

      // let file = new File([audioData], "filename", {type: audioData.type})
      //console.log(file)
      //let reader = new FileReader();
      //reader.readAsDataURL(file);
      //reader.onload = function() {
      //  console.log('reader', reader.result)
      //  localStorage.clear();
      //  localStorage.setItem('shinyStore-ex2\\dynamic_url', JSON.stringify(reader.result));
      //}

      //let data = new FormData();
      //data.append('file', audioData.url)
      //console.log(data)

    }



    // record 5 sec
    useEffect(() => {
      let interval = null;
      if (isActive) {
        interval = setInterval(() => {
                setClockedSec(clockedSec => {
                    if(clockedSec < 5) {
                        return(clockedSec + 1)
                    } else {
                        setIsActive(false)
                        stop();
                        return(0)
                    }
                });
        }, 1000);
      } else if (!isActive) {
        clearInterval(interval);
      }
      return () => clearInterval(interval);
    }, [isActive, clockedSec]);

    return {
      recordState,
      setRecordState,
      audioUrl,
      setAudioUrl,
      isActive,
      setIsActive,
      clockedSec,
      setClockedSec,
      start,
      stop,
      onStop,
      disableDownload,
      setDisableDownload,
      disablePlay, setDisablePlay,
      playRecord, setPlayRecord,
      disableStop, setDisableStop,
      sound, setSound,
      serverAudioHost, setServerAudioHost
    };
  };

  export default useShareableState;
