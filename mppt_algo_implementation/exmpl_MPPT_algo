#include "user.h"
#include "../API/controllers.h"         // Discrete-time controllers

class MPPTracker {
  // Class definition for MPPTracker
};

class PIDController {
  // Class definition for PIDController
};

MPPTracker string1_mppt, string2_mppt;  // Maximum Power Point Trackers
PIDController Ipv_reg;                  // Controller for the PV current

tUserSafe UserBackground();
void SlowSubTask();
float SubTaskTimer = 0.0;
bool SubTaskFlag = false;

USER_SAFE UserInit(void)
{
  // Configure the main timebases on CLOCK_0:
  Clock_SetPeriod(CLOCK_0, static_cast<int>(SWITCHING_FREQUENCY));
 
  // Configure the interrupts:
  ConfigureMainInterrupt(UserInterrupt, CLOCK_0, 0.5);
  RegisterBackgroundCallback(UserBackground);
 
  // Configure the PI controllers:
  ConfigPIDController(&Ipv1_reg, 12.0, 0.3, 0.0, 60, -60, SAMPLING_PERIOD, 10);
 
  // Configure and initialize the MPP-trackers:
  constexpr float increment = 0.01;
  ConfigMPPTracker(&mymppt, increment, 7.0, 16.0, 1.5, 0.01);
 
  return SAFE;
}

tUserSafe UserInterrupt(void)
{
  // Measure all the necessary quantities:
  float Upv = Adc_GetValue(8); // Voltage on the PV string
  float Ipv = -Adc_GetValue(0); // PV current
     
  // Execute the current controllers on the MPPT string:
  float Epv = Upv - RunPIController(&Ipv_reg, Ipv_ref - Ipv);
  CbPwm_SetDutyCycle(PWM_CHANNEL_3, Epv/Udc);
 
  // Compute the power drawn from the PV panel:
  constexpr float k_iir_lpf = 0.05;
  static float Ppv = 0.0;
  Ppv = k_iir_lpf * (Upv * Ipv) + (1.0 - k_iir_lpf) * Ppv;
     
  SubTaskTimer += SWITCHING_PERIOD;
  if (SubTaskTimer >= MPPTPERIOD) {
    SubTaskTimer = SubTaskTimer - MPPTPERIOD;
    SubTaskFlag = true;
  }
   
  return SAFE;
}

tUserSafe UserBackground()
{
  if (SubTaskFlag) {
    SlowSubTask();
    SubTaskFlag = false;
  }
  return SAFE;
}

void SlowSubTask()
{
  // When appropriate, execute the MPPT algorithm:
  if (enable_MPPT == 1) {
    // Run the Maximum Power Point Tracking (MPPT) algorithm:
    Ipv_ref = RunMPPTracking(&string_mppt, Ipv, Ppv);
  }
  // Leave the setpoints unaltered
}
