--
--  Copyright 2020-2020 Datastax inc.
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
--
-- Add a table to control the number of concurrent repairs

CREATE TABLE IF NOT EXISTS running_repairs(
     repair_id uuid,
     node text,
     reaper_instance_host text,
     reaper_instance_id uuid,
     segment_id uuid,
     PRIMARY KEY(repair_id, node))
WITH CLUSTERING ORDER BY (node ASC)
 AND default_time_to_live = 300;