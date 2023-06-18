script "pUpdates";
notify Coolfood;

string filePrefix = "data/pUpdates/prusias_pUpdates_";

void pInitUpdates(string script) {

    string fileName = filePrefix + script + ".txt";
    string[int] updates;
    updates[-1] = "" + 0;
    updates[0] = "pUpdates for " + script + " are now installed";
    if (map_to_file(updates, fileName))
        print("pUpdate successfully initialized.", "teal");
    else
        print("Error, file was not saved.");
}

void pAddUpdate(string script, string update) {
    
    string fileName = filePrefix + script + ".txt";
    string[int] updates;
    file_to_map(fileName, updates);
    int version = updates[-1].to_int() + 1;
    updates[-1] = "" + version;
    updates[version] = update;
    if (map_to_file(updates, fileName))
        print("new update successfully saved.", "teal");
    else
        print("Error, file was not saved.");
}

void pCheckUpdate(string script) {
    string property = "prusias_pUpdates_" + script + "_localVersion";
    //initialize
    if (get_property(property) == "")
        set_property(property, "-1");
    //get data
    string fileName = filePrefix + script + ".txt";
    string[int] updates;
    file_to_map(fileName, updates);
    int version = updates[-1].to_int();
    //print updates
    if (get_property(property).to_int() != version) {
        print_html("<font color=eda800><b>----" + script + "'s latest updates----</b></font>");
        int lastUpdated = get_property(property).to_int();
        for i from (lastUpdated+1) to (version) {
            print_html(i + " <font color=eda800>-</font> " + updates[i]);
        }
        print_html("<font color=eda800>---------------</font>");
        set_property(property, version);
    }
}
