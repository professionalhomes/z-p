create type "public"."RewardType" as enum ('INVITED', 'CLAIMED');

create type "public"."Role" as enum ('ADMIN', 'USER');

create table "public"."challenges" (
    "created_at" timestamp with time zone not null default now(),
    "challenge" text,
    "id" bigint generated by default as identity not null,
    "user_id" text,
    "challenge_id" text
);


create table "public"."pairs" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "contract" text,
    "token_a" text,
    "token_b" text,
    "decimals" integer,
    "name" text,
    "code" text
);


create table "public"."rewards" (
    "id" bigint generated by default as identity not null,
    "user_id" bigint,
    "type" "RewardType",
    "amount" bigint,
    "created_at" timestamp(6) without time zone default CURRENT_TIMESTAMP
);


create table "public"."scores" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "publicKey" text not null,
    "tetris" integer
);


create table "public"."users" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "publicKey" text,
    "secretKey" text,
    "passkey_public_key" smallint[],
    "counter" bigint,
    "transports" text[],
    "passkey_id" text,
    "user_id" text,
    "referral_count" integer default 0,
    "claimed_rewards" integer default 0,
    "email" text,
    "role" "Role"
);


CREATE UNIQUE INDEX challenges_pkey ON public.challenges USING btree (id);

CREATE UNIQUE INDEX "liquidity-keypairs_pkey" ON public.pairs USING btree (id);

CREATE UNIQUE INDEX rewards_pkey ON public.rewards USING btree (id);

CREATE UNIQUE INDEX score_pkey ON public.scores USING btree (id);

CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id);

alter table "public"."challenges" add constraint "challenges_pkey" PRIMARY KEY using index "challenges_pkey";

alter table "public"."pairs" add constraint "liquidity-keypairs_pkey" PRIMARY KEY using index "liquidity-keypairs_pkey";

alter table "public"."rewards" add constraint "rewards_pkey" PRIMARY KEY using index "rewards_pkey";

alter table "public"."scores" add constraint "score_pkey" PRIMARY KEY using index "score_pkey";

alter table "public"."users" add constraint "users_pkey" PRIMARY KEY using index "users_pkey";

alter table "public"."rewards" add constraint "rewards_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."rewards" validate constraint "rewards_user_id_fkey";

grant delete on table "public"."challenges" to "anon";

grant insert on table "public"."challenges" to "anon";

grant references on table "public"."challenges" to "anon";

grant select on table "public"."challenges" to "anon";

grant trigger on table "public"."challenges" to "anon";

grant truncate on table "public"."challenges" to "anon";

grant update on table "public"."challenges" to "anon";

grant delete on table "public"."challenges" to "authenticated";

grant insert on table "public"."challenges" to "authenticated";

grant references on table "public"."challenges" to "authenticated";

grant select on table "public"."challenges" to "authenticated";

grant trigger on table "public"."challenges" to "authenticated";

grant truncate on table "public"."challenges" to "authenticated";

grant update on table "public"."challenges" to "authenticated";

grant delete on table "public"."challenges" to "service_role";

grant insert on table "public"."challenges" to "service_role";

grant references on table "public"."challenges" to "service_role";

grant select on table "public"."challenges" to "service_role";

grant trigger on table "public"."challenges" to "service_role";

grant truncate on table "public"."challenges" to "service_role";

grant update on table "public"."challenges" to "service_role";

grant delete on table "public"."pairs" to "anon";

grant insert on table "public"."pairs" to "anon";

grant references on table "public"."pairs" to "anon";

grant select on table "public"."pairs" to "anon";

grant trigger on table "public"."pairs" to "anon";

grant truncate on table "public"."pairs" to "anon";

grant update on table "public"."pairs" to "anon";

grant delete on table "public"."pairs" to "authenticated";

grant insert on table "public"."pairs" to "authenticated";

grant references on table "public"."pairs" to "authenticated";

grant select on table "public"."pairs" to "authenticated";

grant trigger on table "public"."pairs" to "authenticated";

grant truncate on table "public"."pairs" to "authenticated";

grant update on table "public"."pairs" to "authenticated";

grant delete on table "public"."pairs" to "service_role";

grant insert on table "public"."pairs" to "service_role";

grant references on table "public"."pairs" to "service_role";

grant select on table "public"."pairs" to "service_role";

grant trigger on table "public"."pairs" to "service_role";

grant truncate on table "public"."pairs" to "service_role";

grant update on table "public"."pairs" to "service_role";

grant delete on table "public"."rewards" to "anon";

grant insert on table "public"."rewards" to "anon";

grant references on table "public"."rewards" to "anon";

grant select on table "public"."rewards" to "anon";

grant trigger on table "public"."rewards" to "anon";

grant truncate on table "public"."rewards" to "anon";

grant update on table "public"."rewards" to "anon";

grant delete on table "public"."rewards" to "authenticated";

grant insert on table "public"."rewards" to "authenticated";

grant references on table "public"."rewards" to "authenticated";

grant select on table "public"."rewards" to "authenticated";

grant trigger on table "public"."rewards" to "authenticated";

grant truncate on table "public"."rewards" to "authenticated";

grant update on table "public"."rewards" to "authenticated";

grant delete on table "public"."rewards" to "service_role";

grant insert on table "public"."rewards" to "service_role";

grant references on table "public"."rewards" to "service_role";

grant select on table "public"."rewards" to "service_role";

grant trigger on table "public"."rewards" to "service_role";

grant truncate on table "public"."rewards" to "service_role";

grant update on table "public"."rewards" to "service_role";

grant delete on table "public"."scores" to "anon";

grant insert on table "public"."scores" to "anon";

grant references on table "public"."scores" to "anon";

grant select on table "public"."scores" to "anon";

grant trigger on table "public"."scores" to "anon";

grant truncate on table "public"."scores" to "anon";

grant update on table "public"."scores" to "anon";

grant delete on table "public"."scores" to "authenticated";

grant insert on table "public"."scores" to "authenticated";

grant references on table "public"."scores" to "authenticated";

grant select on table "public"."scores" to "authenticated";

grant trigger on table "public"."scores" to "authenticated";

grant truncate on table "public"."scores" to "authenticated";

grant update on table "public"."scores" to "authenticated";

grant delete on table "public"."scores" to "service_role";

grant insert on table "public"."scores" to "service_role";

grant references on table "public"."scores" to "service_role";

grant select on table "public"."scores" to "service_role";

grant trigger on table "public"."scores" to "service_role";

grant truncate on table "public"."scores" to "service_role";

grant update on table "public"."scores" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";


