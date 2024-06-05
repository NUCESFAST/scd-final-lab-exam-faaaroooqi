#!/bin/bash
cd Auth && npm start &
cd ../Classrooms && npm start &
cd ../event-bus && npm start &
cd ../Post && npm start &
wait
