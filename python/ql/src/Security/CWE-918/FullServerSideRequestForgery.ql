/**
 * @name Full server-side request forgery
 * @description Making a network request to a URL that is fully user-controlled allows for request forgery attacks.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 9.1
 * @precision high
 * @id py/full-ssrf
 * @tags security
 *       external/cwe/cwe-918
 */

import python
import semmle.python.security.dataflow.ServerSideRequestForgery
import DataFlow::PathGraph

from
  FullServerSideRequestForgery::Configuration config, DataFlow::PathNode source,
  DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "The full URL of this request depends on $@.",
  source.getNode(), "a user-provided value"
