﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace C2_Final.Models;

public partial class Vehicle
{
    public int LicensePlateNumber { get; set; }

    public string VehiclesName { get; set; }

    public string Vehiclescolor { get; set; }

    public string Vehiclesmodal { get; set; }

    public string VehiclesYear { get; set; }

    public virtual ICollection<Infraction> Infractions { get; set; } = new List<Infraction>();
}