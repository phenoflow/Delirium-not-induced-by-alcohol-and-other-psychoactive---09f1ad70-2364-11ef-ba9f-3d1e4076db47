# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"17021.0","system":"readv2"},{"code":"56912.0","system":"readv2"},{"code":"7389.0","system":"readv2"},{"code":"38671.0","system":"readv2"},{"code":"25051.0","system":"readv2"},{"code":"22466.0","system":"readv2"},{"code":"25114.0","system":"readv2"},{"code":"94079.0","system":"readv2"},{"code":"68125.0","system":"readv2"},{"code":"24387.0","system":"readv2"},{"code":"52394.0","system":"readv2"},{"code":"70409.0","system":"readv2"},{"code":"49513.0","system":"readv2"},{"code":"69359.0","system":"readv2"},{"code":"55784.0","system":"readv2"},{"code":"5367.0","system":"readv2"},{"code":"22065.0","system":"readv2"},{"code":"25066.0","system":"readv2"},{"code":"50683.0","system":"readv2"},{"code":"39337.0","system":"readv2"},{"code":"24077.0","system":"readv2"},{"code":"4033.0","system":"readv2"},{"code":"37015.0","system":"readv2"},{"code":"53446.0","system":"readv2"},{"code":"21933.0","system":"readv2"},{"code":"24035.0","system":"readv2"},{"code":"53924.0","system":"readv2"},{"code":"61238.0","system":"readv2"},{"code":"F05","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('delirium-not-induced-by-alcohol-and-other-psychoactive-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["delirium-not-induced-by-alcohol-and-other-psychoactive-substance---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
