%module RF24Network

%{
#include "RF24Network/RF24Network.h"
#include "RF24/RF24.h"
%}


%typemap(gotype) (void* message, uint16_t maxlen) %{[]byte%}
%typemap(out) (void* message, uint16_t maxlen) {
   $1 = ($1_ltype)$input.array;
   $2 = $input.len;
}

%typemap(gotype) (const void* message, uint16_t len) %{[]byte%}

%typemap(in) (const void* message, uint16_t len) {
   $1 = ($1_ltype)$input.array;
   $2 = $input.len;
}

%ignore RF24NetworkFrame;
%ignore RF24Network::frag_ptr;
%ignore RF24Network::RF24Network(RF24&, RF24&);
%ignore RF24Network::setup_watchdog;
%ignore RF24Network::failures;
%ignore RF24Network::sleepNode;

%include "stdint.i"

%include "RF24Network.h"