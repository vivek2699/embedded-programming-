# embedded-programming-Sequence Detetector
Design a sequence detector to detect a sequence 1101.
Theory:
Sequential Circuits:
Sequential circuits works on a clock cycle which may be synchronous or
asynchronous. The figure shows a basic diagram of sequential circuits.
Sequential circuits use current inputs and previous inputs by storing the
information and putting back into the circuit on the next clock cycle.
In other words, the output state of a “sequential logic circuit” is a function of
the following three states, the “present input”, the “past input” and/or the
“past output”. Sequential Logic circuits remember these conditions and stay
fixed in their current state until the next clock signal changes one of the states,
giving sequential logic circuits “Memory”.

Finite State Machine (FSM):
A FSM is a model used to design sequential logic circuits. It is
conceived as an abstract machine that can be in one of a finite number of
states. The machine is in only one state at a time; the state it is in at any given
time is called the current state. It can change from one state to another when
initiated by a triggering event or condition, this is called a transition. A
particular FSM is defined by a list of its states, and the triggering
condition for each transition. It can be implemented using models like Mealy
and Moore machine. For this expt., we will use Mealy model implementation.
Mealy Machine:
In this model of FSM, the output values are determined both by its
current state and the current inputs. The state diagram of a mealy machine
associates an output value with each transition edge.

Example:

Here 1/1, 1/0, 0/1, 0/0 represent input/output and S0, S1, S2 represent the states.
Consider a part of the state diagram S1 -> S2 where “0/1” is written on the arrow.
This can be interpreted as, when the current state of the system is S1 and when
input “0” is applied, the system goes into next state - S2 and the output of the
system is “1”.
Sequence detector:
sequence detector is to be designed to detect a sequence 1101.the state diagram
will be:

State S1:
Beginning at state S1 when 0 is received it stays in the same state because it
has nothing to remember and the output is 0 because the sequence 1101 is
not detected. Only at the instant when 1101 sequence is detected the output is
high, that is, 1. Also remember that the flip flops should be used when things
are to be remembered by the circuit. When 1 arrives when in state S1, then it
goes to next state S2 and it remembers that 1 was received which is part of the
sequence 1101 which is to be detected.

State S2:
When in state S2, when 1 arrives, since it is part of the sequence it goes to next state S3,
meaning it remembers 1. When 0 is received it cannot go to next state S3(since 1
received has occupied the transition condition and because 0 is not part of the sequence
and there is nothing to remember), and it cannot remain in the same state S2 because
this would mean 010 indefinite loop while in state S2, therefore it goes back to the initial
state S1. Consider 100 is received and machine remains in S2 when 0 is received, then
because of 1 the state changes from S1 to S2, then 0 is received then the machine stays
in S2 and when another 0 is received then it stays again in S2. But consider when 100 is
received and machine goes back to S1, then when 1 is received it changes state from S1
to S2, when 0 is received then goes back to S1 and when another 0 is received it stays in
S1.
State S3:
When in state S3, when 0 is received then since it is part of the sequence 1101 it goes to
new state S4 because the machine has to remember the new bit 0 as part of the
sequence detection algorithm. When 1 is received it stays in the same state.
State S4:
When in state S4, when 1 is received then since it is part of the sequence 1101 to be
detected it goes to S2. And when 0 is received then it goes back to initial state S1. At this
point the machine outputs 1.

Note that this state diagram is considering overlap i.e. if we have input 1101101 we
will have output 0001001.
For same input, non-overlap case will have output 0001000. Either cases are correct
but we will consider only overlap case henceforth.

VHDL SIMULATION OUTPUT:
For example :-
simulated digital waveform for the seqence 10101101010110001
