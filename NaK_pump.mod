TITLE Mod file for component: Component(id=generated_model__sodium_potassium_pump_current_0 type=generated_model__sodium_potassium_pump_current)

COMMENT

    This NEURON file has been generated by org.neuroml.export (see https://github.com/NeuroML/org.neuroml.export)
         org.neuroml.export  v1.4.6
         org.neuroml.model   v1.4.6
         jLEMS               v0.9.8.6

ENDCOMMENT

NEURON {
    SUFFIX NaK_pump :generated_model__sodium_potassium_pump_current_0
    USEION na READ nai, nao WRITE ina 
    USEION k READ ki, ko WRITE ik 
    
    RANGE Km_Nai                            : parameter
    RANGE Km_Ko                             : parameter
    RANGE i_NaK_max                         : parameter
    : RANGE V                                 : parameter
    : RANGE T                                 : parameter
    : RANGE R                                 : parameter
    : RANGE F                                 : parameter
    : RANGE Nai                               : parameter
    : RANGE Ko                                : parameter
    : RANGE Nao                               : parameter
    : RANGE tscale                            : parameter
    
    RANGE f_NaK                             : exposure
    
    RANGE i_NaK                             : exposure
    
    RANGE ina
    RANGE ik
    RANGE sigma                             : exposure
    
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
    F       = (faraday) (kilocoulombs)
    :F      = (faraday) (coulomb)
    R       = (k-mole) (joule/degC)
    
}

PARAMETER {
    
    Km_Nai = 21000 (mM)
    Km_Ko = 1500 (mM)
    i_NaK_max = 0.88e-3 (mA/cm2)
    v (mV)
    nai (mM) 
    ki (mM)
    ko (mM)
    nao (mM) 
    tscale = 0.001 (kHz)
    celsius (degC)
}

ASSIGNED {
    
    T (degC)
    
    f_NaK (1)                                 : derived variable
    
    i_NaK (mA/cm2)                                  : derived variable
    
    ina (mA/cm2)
    
    ik (mA/cm2)
    
    sigma   (1)    : derived variable
    
}


INITIAL {
    T = 273 + celsius
    
    rates(v)
    rates(v) ? To ensure correct initialisation.
    
}

BREAKPOINT {
    
    rates(v)
    i_NaK = (((  i_NaK_max   *   f_NaK  ) * (1.0 / (1.0 + ((  Km_Nai   /   nai  ) ^ 1.5)))) * (  ko   / (  ko   +   Km_Ko  ))) ? evaluable
    
    ina = 3 * i_NaK
    ik = -2 * i_NaK
}

PROCEDURE rates(v (mV)) {
    
    f_NaK = (1.0 / ((1.0 + (0.1245 * exp(((( - 0.1 ) *   v  ) * (  F   / (  R   *   T  )))))) + ((0.0365 *   sigma  ) * exp((( -   v  ) * (  F   / (  R   *   T  ))))))) ? evaluable

    sigma = ((1.0 / 7.0) * (exp((  nao   / 67300.0 (mM))) - 1.0)) ? evaluable
    
     
    
}

