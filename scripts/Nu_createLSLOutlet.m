function outlet = Nu_createLSLOutlet(name)
    streamInfo = lsl_streaminfo(lsl_loadlib(), name, 'Markers', 1, 0, 'cf_string', 'myuniquesourceid23443');
    outlet = lsl_outlet(streamInfo);
end