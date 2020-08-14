

# Brazilian Mayoral Candidates

The purpose of this repository -- Brazilian Mayoral Candidates -- is to harvest Brazilian mayoral candidate platforms, do bits of feature-extraction from the resulting collection, and distill the whole thing into a data set for more in-depth analysis. 


## Metadata

We begin with two sets of CSV files (./metadata-2012/* and ./metadata-2016/*) denoting the characteristics of the mayoral candidates from 2012 and 2016. These CSV files were found on the Web and used to manually create as many as three SQLite database schema files (./etc/schema-2012, ./etc/schema-2016.sql, and ./etc/schema-master.sql). We then run ./bin/import-2012.sh, ./bin/import-2016.sh, and ./bin/db-initialize-master.sh to initially populate the databases.


## Computing URLs

The URLs pointing to the mayoral candidate platforms can be computed from the metadata. This is done with ./bin/insert-urls-2012.sh and ./bin/insert-urls-2016.sh But since the totality of metadata files is in flux (especially for the 2016 data), an additional script (./bin/tsv2sql.pl) is used to ingest additional metadata and compute additional URLs.


## Dump

At this point we have a master database of mayoral candidates, and using ./bin/dump-master.sh we can export the database as a CSV file, just because CSV is human-readable. The use of this this CSV file for scholarly research is a poor substitute for the use of database itself.


## Feature extraction

The next step is feature-extraction, and it begins with ./bin/harvest.sh which loops through all the URLs and locally caches the mayoral candidate platforms. Each (PDF) file in the cache then needs to have its underlying plain text extracted. This is accomplished by running ./bin/extract-text.sh which is a front-end to the venerable tool named "Tika". I would not be able to a lot of my work if Tika did not exist.

Named entities and parts-of-speech are extracted from each plain text file using ./bin/txt2ent.qsub and ./bin/txt2pos.qsub, respectively. These two scripts are ultimately front-ends to a pair of Python programs which take advantage of a particular Python module called "spaCy" -- a natural language processing library. Given a stream of plain text, spaCy compares the text to its Portuguese language model, and does the actual work of outputting entities and parts-of-speech.

The output is saved a set of tab-delimited files, and these files are transformed into SQL INSERT statements (using ./bin/ent2sql.qsub and ./bin/pos2sql.qsub), and the statements are finally reduced into the master database (using ./bin/reduce-ent.sh and ./bin/reduce-pos.sh).  


## Done, sort of

The work is now done, sort of. The metadata has been saved to a database. The platforms have been harvested and transformed into plain text. The plain text has had features extracted from them, and the features have been saved to the database as well.

Much of the work outlined above has been amalgamated into a single script, ./bin/build.sh, but since software is never done, the script will probably not completely work. After all, this process has a whole lot of moving parts.

Once done, all of the data can be found in the ./etc/candidates-master.db, ./pdf, ./txt, ./ent, and ./pos files/directories, but this data is not a part of this repository; the data is expected to be computed; the data changes.


## Next steps

It is now up to the student, researcher, or scholar to use the data to answer questions. The most straight-forward way to do this is to query the database, and many example queries are manifested in ./etc/report.sql.

While all the named-entities and parts-of-speech values are in the database, searching for them may require really ugly SQL SELECT statements. But since the named-entities and parts-of-speech values are also saved as sets of tab-delimited files (./ent, ./pos), it is possible to use additional tools for analysis. Your favorite spreadsheet application is one such tool, but instead I really suggest the use of OpenRefines. OpenRefine eats tab delimited files for lunch, but like everything else, the effective use of OpenRefine requires practice.

The sets of plain text files (./txt) are another huge source of information/knowledge. For example, simple ngram extraction and computed keyword generation will allude to the student, researcher, or scholar the "aboutness" of the collection and its subsets. After ngrams or keywords are enumerated, the student, researcher, or scholar can use some sort of concordance application (like AntConc) to see how those words are used in the context of the platforms.

Additionally, both supervised and unsupervised machine learning processes could be applied to the plain text files. For example, the unsupervised machine learning process called "topic modeling" could be used to enumerate "themes" or "subjects" in the collection and its subsets. This is a wonderful way to read the collection "at a distance". I suggest a software system called "MALLET" be used to do this good work.

The application of a supervised machine learning process (such as classification) can also be quite insightful. For example, sets of platforms strongly exemplifying one point of view or another can be assembled into different directories. Algorithms called Naive Bayes or Support Vector Machine can then be applied to the directories, thus creating a statistical model. Once a model is created (with a high degree of accuracy), other platforms can be compare do the model, and the result will be sets of classified documents. In the end, the student, researcher, or scholar will have additional ways to compare and contrast platforms, and along the way they might discover new patterns or anomalies. This last technique is the most advanced of the lot. To the best of my knowledge there are no software applications which do this sort of work. Instead, such software needs to be written, and the Python modules found at Scikit-learn are scholarly, well-respected, and relatively easy to implement.

Given the "ingredients" outlined above, here is a "recipe" for "baking" the research process:

   0. Articulate a research question, and because computers are stupid, formulate the question so the answer is more or less quantitative in nature.
   
   1. Transform your question into an SQL SELECT statement and query the database. The result will be a word, a number, a metadata value, a list of words and/or numbers and/or metadata values, or a matrix of words and/or numbers and/or metadata values.
   
   2. If apropos, use the result of Step #1 to create a subset of the platforms and apply concordancing or the traditional reading against them.
   
   3. If the result of Step #2 is too large for concordancing or traditional reading, then consider the use of a machine learning process to facilitate distant reading.
   
   4. Illustrate (chart and graph) the results of Steps #1, #2, and #3.
   
   5. Use the results of Steps #1, #2, #3, and #4 to infer answers to the research question. Through the process of inferring you will be able to address qualitative research questions.
   
   6. Document, share, and discuss the result of Step #5 with friends, family, and colleagues.
   
   7. Go to Step #0. This is a never-ending process.
   
Like any recipe, the one outlined above is really a set of suggestions. Thus, you will want to "season to taste."

--- 
Eric Lease Morgan &lt;emorgan@nd.edu&gt;  
August 14, 2020

