TITLE Mod file for component: Component(id=generated_model__non_inactivating_steady_state_potassium_current_0 type=generated_model__non_inactivating_steady_state_potassium_current)

COMMENT

    This NEURON file has been generated by org.neuroml.export (see https://github.com/NeuroML/org.neuroml.export)
         org.neuroml.export  v1.4.6
         org.neuroml.model   v1.4.6
         jLEMS               v0.9.8.6

ENDCOMMENT

NEURON {
    SUFFIX Kss :generated_model__non_inactivating_steady_state_potassium_current_0
    USEION k READ ek, ki, ko WRITE ik 
    RANGE g                             : parameter
    :RANGE V                                 : parameter
    : RANGE E_K                               : parameter
    : RANGE time_                             : parameter
    RANGE ass                               : parameter
    : RANGE tscale                            : parameter
    
    RANGE ik                             : exposure
    
    RANGE tau_Kss                           : exposure
    
}

UNITS {
    
    (nA) = (nanoamp)
    (uA) = (microamp)
    (mA) = (milliamp)
    (A) = (amp)
    (mV) = (millivolt)
    (mS) = (millisiemens)
    (uS) = (microsiemens)
    (molar) = (1/liter)
    (kHz) = (kilohertz)
    (mM) = (millimolar)
    (um) = (micrometer)
    (umol) = (micromole)
    (S) = (siemens)
    
}

PARAMETER {
    
    g = 0.000088 (mho/cm2)
    v (mV) 
    :E_K = NaN 
    : time_ = NaN 
    : tscale = 0.001 (kHz)
}

ASSIGNED {
    
    ass (1) :slow_transient_outward_potassium_current.ass 
    ek (mV)                                   : derived variable
    ik (mA/cm2) :i_Kss                                  : derived variable
    ko (mM)
    ki (mM)
    tau_Kss (ms)                                : derived variable
    rate_aKss (/ms)
    rate_iKss (/ms)
    
    iKss (1)
}

STATE {
    aKss (1)
    : iKss  
    
}

INITIAL {
    rates(v)
    rates(v) ? To ensure correct initialisation.
    
    aKss = 4.17069E-4
    
    iKss = 1.0
    
}

BREAKPOINT {
    
    SOLVE states METHOD cnexp
    ik = (((  g   *   aKss  ) *   iKss  ) * (  v   -   ek  )) ? evaluable
    
    
}

DERIVATIVE states {
    rates(v)
    aKss' = (((  ass   -   aKss  ) /   tau_Kss  ))
    : iKss' = rate_iKss 
    
}

PROCEDURE rates(v (mV)) {
    
    ass = 1 / (1 + exp(-(v + 22.5 (mV) ) / 7.7 (mV) ))
    tau_Kss = ((39.3 (ms) * exp((( - 0.0862 (/mV)) *   v  ))) + 13.17 (ms)) ? evaluable
    : rate_iKss = tscale  * (0.0) ? Note units of all quantities used here need to be consistent!
    :rate_aKss = tscale  * (((  ass   -   aKss  ) /   tau_Kss  )) ? Note units of all quantities used here need to be consistent!
    
     
    
}
