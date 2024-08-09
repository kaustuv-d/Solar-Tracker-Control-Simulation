%% Using the Worm and Gear Constraint Block - Solar Tracker
% This example illustrates the use of the Worm and Gear Constraint block to
% model a solar tracker. A slew drive containing a worm and gear constraint
% powers the yaw rotation of the solar trackers. The worm and gear geometry
% gives a large reduction in a single stage of gearing which provides precision
% tracking and high torque output. The yaw rotation is specified as a motion
% input to the gear revolute joint and the necessary actuator torque is 
% automatically computed at the worm revolute joint.
%
% Copyright 2008-2023 The MathWorks, Inc.

open_system('WormAndGearConstraint');
%%
close_system('WormAndGearConstraint');
