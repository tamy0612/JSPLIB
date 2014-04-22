# JSPLIB

Benchmark instances for the job-shop scheduling problem (minimizing makespan).

## Meta-data

The file `instances.json` has meta-data of each instance as follows.

```
{
  "name" : "instance", // the name of the instance [required]
  "jobs" : n,          // the number of jobs [required]
  "machines" : m,      // the number of machines [required]
  "optimum" : c,       // the optimum makespan or null [required]
  "bounds" : {         // required when the optimum is null
    "upper" : ub,      // the upper-bounds of makespan
    "lower" : lb,      // the lower-bounds of makespan
  },
  "path" : "*****"     // the file path to the instance [required]
}
```

## Includes

- Five instances donated as ABZ5-9 due to Adams et al. [1].
- Three instances donated as FT06, FT10 and FT20 due to Fisher and Thompson [2].
- Forty instances donated as LA01-40 due to Lawrence [3].
- Ten instances donated as ORB01-10 due to Applegate and Cook [4].
- Twenty instances donated as SWV01-20 due to Storer et al. [5].
- Four instances donated as yn1-4 due to Yamada and Nakano [6].
- Eighty instances donated as ta01-80 due to Taillard [7].

## References

1. J. Adams, E. Balas, D. Zawack. "The shifting bottleneck procedure for job shop scheduling.", Management Science, Vol. 34, Issue 3, pp. 391-401, 1988.
2. J.F. Muth, G.L. Thompson. "Industrial scheduling.", Englewood Cliffs, NJ, Prentice-Hall, 1963.
3. S. Lawrence. "Resource constrained project scheduling: an experimental investigation of heuristic scheduling techniques (Supplement).", Graduate School of Industrial Administration. Pittsburgh, Pennsylvania, Carnegie-Mellon University, 1984.
4. D. Applegate, W. Cook. "A computational study of job-shop scheduling.", ORSA Journal on Computer, Vol. 3, Isuue 2, pp. 149-156, 1991.
5. R.H. Storer, S.D. Wu, R. Vaccari. "New search spaces for sequencing problems with applications to job-shop scheduling.", Management Science Vol. 38, Issue 10, pp. 1495-1509, 1992.
6. T. Yamada, R. Nakano. "A genetic algorithm applicable to large-scale job-shop problems.", Proceedings of the Second international workshop on parallel problem solving from Nature (PPSN'2). Brussels (Belgium), pp. 281-290, 1992.
7. E. Taillard. "Benchmarks for basic scheduling problems", European Journal of Operational Research, Vol. 64, Issue 2, pp. 278-285, 1993.
