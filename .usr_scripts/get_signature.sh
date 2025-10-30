#!/bin/bash
pass show digital_signature/file | base64 --decode > /tmp/signature2.p12
