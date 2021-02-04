function testingcmdp = import_SOL_LP(filename, dataLines)
%IMPORTFILE Import data from a text file
%  TESTINGCMDP = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the numeric data.
%
%  TESTINGCMDP = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  testingcmdp = importfile("/home/thomas/Dropbox/Grad_School/SVN/testing_cmdp.sol", [3, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 03-Oct-2019 15:16:01

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
	dataLines = [3, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["solution", "status", "Var3"];
opts.SelectedVariableNames = ["solution", "status"];
opts.VariableTypes = ["double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Specify variable properties
opts = setvaropts(opts, "Var3", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var3", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "solution", "TrimNonNumeric", true);
opts = setvaropts(opts, "solution", "ThousandsSeparator", ",");

% Import the data
testingcmdp = readtable(filename, opts);

%% Convert to output type
testingcmdp = table2array(testingcmdp);
end