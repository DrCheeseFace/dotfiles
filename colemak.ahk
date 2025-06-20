#SingleInstance

CapsLock::Esc
RCtrl::CapsLock

global isColemak := 0

F12::
{
    global isColemak
    isColemak := !isColemak
    if (isColemak) {
        ToolTip GLaDOS mode
    } else {
        ToolTip STANLEY mode
    }
    SetTimer RemoveToolTip, -2000 
}

RemoveToolTip()
{
    ToolTip
}

#If isColemak
q::q
w::w
e::f
r::p
t::g
y::j
u::l
i::u
o::y
p::`;
[::[
]::]
a::a
s::r
d::s
f::t
g::d
h::h
j::n
k::e
l::i
`;::o
'::'
z::z
x::x
c::c
v::v
b::b
n::k
m::m
,::,
.::.
/::/
#If
