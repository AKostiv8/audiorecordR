import React, { useState, useEffect } from 'react';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';
import { FaPlay, FaPause } from "react-icons/fa";
import {Howl, Howler} from 'howler';


import './PlayRecord.css';



function PlayRecordButton() {

  const { audioUrl, disablePlay, playRecord, setPlayRecord, sound, setSound } = useBetween(useShareableState);

  const toggle = () => {


       if (playRecord) {
          sound.pause();
          setPlayRecord(false);
        } else {
          sound.play();
          setPlayRecord(true);
        }


        sound.on('end', function(){
          console.log('Finished!');
          setPlayRecord(false);
        });


  }


  return (
      <button
          className={`playButton playButton_active
                      ${playRecord ? "playButton_animation" : ""}
                      ${disablePlay ? "playButton_blocked": ""}
                     `}
          onClick={toggle}
          disabled={disablePlay}
      >
          {playRecord ? <FaPause /> : <FaPlay/>}
      </button>
  );

}

export default PlayRecordButton;

